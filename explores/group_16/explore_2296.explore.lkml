# Explore: explore_2296
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06889.view.lkml"
include: "/views/domain_41/view_06891.view.lkml"
include: "/views/domain_42/view_06892.view.lkml"
include: "/views/domain_43/view_06893.view.lkml"

explore: explore_2296 {
  label: "Explore Explore 2296"
  description: "Comprehensive analytics explore joining base view_06889 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06889
  
  always_filter: {
    filters: [view_06889.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06889.created_at_date: "7 days"]
    unless: [view_06889.id, view_06889.status]
  }

  join: view_06891 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06889.user_id} = ${view_06891.id} ;;
    required_joins: []
  }

  join: view_06892 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06889.account_id} = ${view_06892.account_id} ;;
    required_joins: [view_06891]
  }

  join: view_06893 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06889.category} = ${view_06893.category} ;;
  }

  access_filter: {
    field: view_06889.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06889.is_deleted} = false ;;
}
