# Explore: explore_3723
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11170.view.lkml"
include: "/views/domain_22/view_11172.view.lkml"
include: "/views/domain_23/view_11173.view.lkml"
include: "/views/domain_24/view_11174.view.lkml"

explore: explore_3723 {
  label: "Explore Explore 3723"
  description: "Comprehensive analytics explore joining base view_11170 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11170
  
  always_filter: {
    filters: [view_11170.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11170.created_at_date: "7 days"]
    unless: [view_11170.id, view_11170.status]
  }

  join: view_11172 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11170.user_id} = ${view_11172.id} ;;
    required_joins: []
  }

  join: view_11173 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11170.account_id} = ${view_11173.account_id} ;;
    required_joins: [view_11172]
  }

  join: view_11174 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11170.category} = ${view_11174.category} ;;
  }

  access_filter: {
    field: view_11170.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11170.is_deleted} = false ;;
}
