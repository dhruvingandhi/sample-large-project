# Explore: explore_1683
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05050.view.lkml"
include: "/views/domain_02/view_05052.view.lkml"
include: "/views/domain_03/view_05053.view.lkml"
include: "/views/domain_04/view_05054.view.lkml"

explore: explore_1683 {
  label: "Explore Explore 1683"
  description: "Comprehensive analytics explore joining base view_05050 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05050
  
  always_filter: {
    filters: [view_05050.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05050.created_at_date: "7 days"]
    unless: [view_05050.id, view_05050.status]
  }

  join: view_05052 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05050.user_id} = ${view_05052.id} ;;
    required_joins: []
  }

  join: view_05053 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05050.account_id} = ${view_05053.account_id} ;;
    required_joins: [view_05052]
  }

  join: view_05054 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05050.category} = ${view_05054.category} ;;
  }

  access_filter: {
    field: view_05050.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05050.is_deleted} = false ;;
}
