# Explore: explore_3346
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10039.view.lkml"
include: "/views/domain_41/view_10041.view.lkml"
include: "/views/domain_42/view_10042.view.lkml"
include: "/views/domain_43/view_10043.view.lkml"

explore: explore_3346 {
  label: "Explore Explore 3346"
  description: "Comprehensive analytics explore joining base view_10039 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10039
  
  always_filter: {
    filters: [view_10039.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10039.created_at_date: "7 days"]
    unless: [view_10039.id, view_10039.status]
  }

  join: view_10041 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10039.user_id} = ${view_10041.id} ;;
    required_joins: []
  }

  join: view_10042 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10039.account_id} = ${view_10042.account_id} ;;
    required_joins: [view_10041]
  }

  join: view_10043 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10039.category} = ${view_10043.category} ;;
  }

  access_filter: {
    field: view_10039.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10039.is_deleted} = false ;;
}
