# Explore: explore_2986
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08959.view.lkml"
include: "/views/domain_11/view_08961.view.lkml"
include: "/views/domain_12/view_08962.view.lkml"
include: "/views/domain_13/view_08963.view.lkml"

explore: explore_2986 {
  label: "Explore Explore 2986"
  description: "Comprehensive analytics explore joining base view_08959 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08959
  
  always_filter: {
    filters: [view_08959.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08959.created_at_date: "7 days"]
    unless: [view_08959.id, view_08959.status]
  }

  join: view_08961 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08959.user_id} = ${view_08961.id} ;;
    required_joins: []
  }

  join: view_08962 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08959.account_id} = ${view_08962.account_id} ;;
    required_joins: [view_08961]
  }

  join: view_08963 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08959.category} = ${view_08963.category} ;;
  }

  access_filter: {
    field: view_08959.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08959.is_deleted} = false ;;
}
