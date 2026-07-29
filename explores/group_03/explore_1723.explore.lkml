# Explore: explore_1723
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05170.view.lkml"
include: "/views/domain_22/view_05172.view.lkml"
include: "/views/domain_23/view_05173.view.lkml"
include: "/views/domain_24/view_05174.view.lkml"

explore: explore_1723 {
  label: "Explore Explore 1723"
  description: "Comprehensive analytics explore joining base view_05170 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05170
  
  always_filter: {
    filters: [view_05170.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05170.created_at_date: "7 days"]
    unless: [view_05170.id, view_05170.status]
  }

  join: view_05172 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05170.user_id} = ${view_05172.id} ;;
    required_joins: []
  }

  join: view_05173 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05170.account_id} = ${view_05173.account_id} ;;
    required_joins: [view_05172]
  }

  join: view_05174 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05170.category} = ${view_05174.category} ;;
  }

  access_filter: {
    field: view_05170.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05170.is_deleted} = false ;;
}
