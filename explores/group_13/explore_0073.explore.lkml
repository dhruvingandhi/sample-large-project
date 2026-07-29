# Explore: explore_0073
# Auto-generated LookML Explore File

include: "/views/domain_20/view_00220.view.lkml"
include: "/views/domain_22/view_00222.view.lkml"
include: "/views/domain_23/view_00223.view.lkml"
include: "/views/domain_24/view_00224.view.lkml"

explore: explore_0073 {
  label: "Explore Explore 0073"
  description: "Comprehensive analytics explore joining base view_00220 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00220
  
  always_filter: {
    filters: [view_00220.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00220.created_at_date: "7 days"]
    unless: [view_00220.id, view_00220.status]
  }

  join: view_00222 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00220.user_id} = ${view_00222.id} ;;
    required_joins: []
  }

  join: view_00223 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00220.account_id} = ${view_00223.account_id} ;;
    required_joins: [view_00222]
  }

  join: view_00224 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00220.category} = ${view_00224.category} ;;
  }

  access_filter: {
    field: view_00220.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00220.is_deleted} = false ;;
}
