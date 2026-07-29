# Explore: explore_3633
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10900.view.lkml"
include: "/views/domain_02/view_10902.view.lkml"
include: "/views/domain_03/view_10903.view.lkml"
include: "/views/domain_04/view_10904.view.lkml"

explore: explore_3633 {
  label: "Explore Explore 3633"
  description: "Comprehensive analytics explore joining base view_10900 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10900
  
  always_filter: {
    filters: [view_10900.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10900.created_at_date: "7 days"]
    unless: [view_10900.id, view_10900.status]
  }

  join: view_10902 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10900.user_id} = ${view_10902.id} ;;
    required_joins: []
  }

  join: view_10903 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10900.account_id} = ${view_10903.account_id} ;;
    required_joins: [view_10902]
  }

  join: view_10904 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10900.category} = ${view_10904.category} ;;
  }

  access_filter: {
    field: view_10900.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10900.is_deleted} = false ;;
}
