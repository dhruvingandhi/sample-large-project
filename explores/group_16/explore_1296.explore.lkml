# Explore: explore_1296
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03889.view.lkml"
include: "/views/domain_41/view_03891.view.lkml"
include: "/views/domain_42/view_03892.view.lkml"
include: "/views/domain_43/view_03893.view.lkml"

explore: explore_1296 {
  label: "Explore Explore 1296"
  description: "Comprehensive analytics explore joining base view_03889 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03889
  
  always_filter: {
    filters: [view_03889.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03889.created_at_date: "7 days"]
    unless: [view_03889.id, view_03889.status]
  }

  join: view_03891 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03889.user_id} = ${view_03891.id} ;;
    required_joins: []
  }

  join: view_03892 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03889.account_id} = ${view_03892.account_id} ;;
    required_joins: [view_03891]
  }

  join: view_03893 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03889.category} = ${view_03893.category} ;;
  }

  access_filter: {
    field: view_03889.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03889.is_deleted} = false ;;
}
