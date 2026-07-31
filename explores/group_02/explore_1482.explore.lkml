# Update for 500 file diff target
# Explore: explore_1482
# Auto-generated LookML Explore File

include: "/views/domain_47/view_04447.view.lkml"
include: "/views/domain_49/view_04449.view.lkml"
include: "/views/domain_50/view_04450.view.lkml"
include: "/views/domain_01/view_04451.view.lkml"

explore: explore_1482 {
  label: "Explore Explore 1482"
  description: "Comprehensive analytics explore joining base view_04447 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04447
  
  always_filter: {
    filters: [view_04447.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04447.created_at_date: "7 days"]
    unless: [view_04447.id, view_04447.status]
  }

  join: view_04449 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04447.user_id} = ${view_04449.id} ;;
    required_joins: []
  }

  join: view_04450 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04447.account_id} = ${view_04450.account_id} ;;
    required_joins: [view_04449]
  }

  join: view_04451 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04447.category} = ${view_04451.category} ;;
  }

  access_filter: {
    field: view_04447.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04447.is_deleted} = false ;;
}
