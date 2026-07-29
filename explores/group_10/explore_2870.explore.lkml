# Explore: explore_2870
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08611.view.lkml"
include: "/views/domain_13/view_08613.view.lkml"
include: "/views/domain_14/view_08614.view.lkml"
include: "/views/domain_15/view_08615.view.lkml"

explore: explore_2870 {
  label: "Explore Explore 2870"
  description: "Comprehensive analytics explore joining base view_08611 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08611
  
  always_filter: {
    filters: [view_08611.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08611.created_at_date: "7 days"]
    unless: [view_08611.id, view_08611.status]
  }

  join: view_08613 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08611.user_id} = ${view_08613.id} ;;
    required_joins: []
  }

  join: view_08614 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08611.account_id} = ${view_08614.account_id} ;;
    required_joins: [view_08613]
  }

  join: view_08615 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08611.category} = ${view_08615.category} ;;
  }

  access_filter: {
    field: view_08611.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08611.is_deleted} = false ;;
}
