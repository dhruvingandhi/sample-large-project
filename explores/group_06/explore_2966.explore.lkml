# Explore: explore_2966
# Auto-generated LookML Explore File

include: "/views/domain_49/view_08899.view.lkml"
include: "/views/domain_01/view_08901.view.lkml"
include: "/views/domain_02/view_08902.view.lkml"
include: "/views/domain_03/view_08903.view.lkml"

explore: explore_2966 {
  label: "Explore Explore 2966"
  description: "Comprehensive analytics explore joining base view_08899 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08899
  
  always_filter: {
    filters: [view_08899.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08899.created_at_date: "7 days"]
    unless: [view_08899.id, view_08899.status]
  }

  join: view_08901 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08899.user_id} = ${view_08901.id} ;;
    required_joins: []
  }

  join: view_08902 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08899.account_id} = ${view_08902.account_id} ;;
    required_joins: [view_08901]
  }

  join: view_08903 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08899.category} = ${view_08903.category} ;;
  }

  access_filter: {
    field: view_08899.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08899.is_deleted} = false ;;
}
