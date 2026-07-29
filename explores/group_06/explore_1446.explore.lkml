# Explore: explore_1446
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04339.view.lkml"
include: "/views/domain_41/view_04341.view.lkml"
include: "/views/domain_42/view_04342.view.lkml"
include: "/views/domain_43/view_04343.view.lkml"

explore: explore_1446 {
  label: "Explore Explore 1446"
  description: "Comprehensive analytics explore joining base view_04339 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04339
  
  always_filter: {
    filters: [view_04339.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04339.created_at_date: "7 days"]
    unless: [view_04339.id, view_04339.status]
  }

  join: view_04341 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04339.user_id} = ${view_04341.id} ;;
    required_joins: []
  }

  join: view_04342 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04339.account_id} = ${view_04342.account_id} ;;
    required_joins: [view_04341]
  }

  join: view_04343 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04339.category} = ${view_04343.category} ;;
  }

  access_filter: {
    field: view_04339.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04339.is_deleted} = false ;;
}
