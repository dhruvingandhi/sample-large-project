# Explore: explore_0296
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00889.view.lkml"
include: "/views/domain_41/view_00891.view.lkml"
include: "/views/domain_42/view_00892.view.lkml"
include: "/views/domain_43/view_00893.view.lkml"

explore: explore_0296 {
  label: "Explore Explore 0296"
  description: "Comprehensive analytics explore joining base view_00889 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00889
  
  always_filter: {
    filters: [view_00889.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00889.created_at_date: "7 days"]
    unless: [view_00889.id, view_00889.status]
  }

  join: view_00891 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00889.user_id} = ${view_00891.id} ;;
    required_joins: []
  }

  join: view_00892 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00889.account_id} = ${view_00892.account_id} ;;
    required_joins: [view_00891]
  }

  join: view_00893 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00889.category} = ${view_00893.category} ;;
  }

  access_filter: {
    field: view_00889.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00889.is_deleted} = false ;;
}
