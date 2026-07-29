# Explore: explore_0723
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02170.view.lkml"
include: "/views/domain_22/view_02172.view.lkml"
include: "/views/domain_23/view_02173.view.lkml"
include: "/views/domain_24/view_02174.view.lkml"

explore: explore_0723 {
  label: "Explore Explore 0723"
  description: "Comprehensive analytics explore joining base view_02170 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02170
  
  always_filter: {
    filters: [view_02170.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02170.created_at_date: "7 days"]
    unless: [view_02170.id, view_02170.status]
  }

  join: view_02172 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02170.user_id} = ${view_02172.id} ;;
    required_joins: []
  }

  join: view_02173 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02170.account_id} = ${view_02173.account_id} ;;
    required_joins: [view_02172]
  }

  join: view_02174 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02170.category} = ${view_02174.category} ;;
  }

  access_filter: {
    field: view_02170.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02170.is_deleted} = false ;;
}
