# Explore: explore_1112
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03337.view.lkml"
include: "/views/domain_39/view_03339.view.lkml"
include: "/views/domain_40/view_03340.view.lkml"
include: "/views/domain_41/view_03341.view.lkml"

explore: explore_1112 {
  label: "Explore Explore 1112"
  description: "Comprehensive analytics explore joining base view_03337 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03337
  
  always_filter: {
    filters: [view_03337.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03337.created_at_date: "7 days"]
    unless: [view_03337.id, view_03337.status]
  }

  join: view_03339 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03337.user_id} = ${view_03339.id} ;;
    required_joins: []
  }

  join: view_03340 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03337.account_id} = ${view_03340.account_id} ;;
    required_joins: [view_03339]
  }

  join: view_03341 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03337.category} = ${view_03341.category} ;;
  }

  access_filter: {
    field: view_03337.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03337.is_deleted} = false ;;
}
