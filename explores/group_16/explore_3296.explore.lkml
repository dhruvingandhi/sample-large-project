# Explore: explore_3296
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09889.view.lkml"
include: "/views/domain_41/view_09891.view.lkml"
include: "/views/domain_42/view_09892.view.lkml"
include: "/views/domain_43/view_09893.view.lkml"

explore: explore_3296 {
  label: "Explore Explore 3296"
  description: "Comprehensive analytics explore joining base view_09889 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09889
  
  always_filter: {
    filters: [view_09889.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09889.created_at_date: "7 days"]
    unless: [view_09889.id, view_09889.status]
  }

  join: view_09891 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09889.user_id} = ${view_09891.id} ;;
    required_joins: []
  }

  join: view_09892 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09889.account_id} = ${view_09892.account_id} ;;
    required_joins: [view_09891]
  }

  join: view_09893 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09889.category} = ${view_09893.category} ;;
  }

  access_filter: {
    field: view_09889.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09889.is_deleted} = false ;;
}
