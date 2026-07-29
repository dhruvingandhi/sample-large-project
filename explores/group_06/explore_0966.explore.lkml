# Explore: explore_0966
# Auto-generated LookML Explore File

include: "/views/domain_49/view_02899.view.lkml"
include: "/views/domain_01/view_02901.view.lkml"
include: "/views/domain_02/view_02902.view.lkml"
include: "/views/domain_03/view_02903.view.lkml"

explore: explore_0966 {
  label: "Explore Explore 0966"
  description: "Comprehensive analytics explore joining base view_02899 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02899
  
  always_filter: {
    filters: [view_02899.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02899.created_at_date: "7 days"]
    unless: [view_02899.id, view_02899.status]
  }

  join: view_02901 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02899.user_id} = ${view_02901.id} ;;
    required_joins: []
  }

  join: view_02902 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02899.account_id} = ${view_02902.account_id} ;;
    required_joins: [view_02901]
  }

  join: view_02903 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02899.category} = ${view_02903.category} ;;
  }

  access_filter: {
    field: view_02899.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02899.is_deleted} = false ;;
}
