# Explore: explore_2943
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08830.view.lkml"
include: "/views/domain_32/view_08832.view.lkml"
include: "/views/domain_33/view_08833.view.lkml"
include: "/views/domain_34/view_08834.view.lkml"

explore: explore_2943 {
  label: "Explore Explore 2943"
  description: "Comprehensive analytics explore joining base view_08830 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08830
  
  always_filter: {
    filters: [view_08830.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08830.created_at_date: "7 days"]
    unless: [view_08830.id, view_08830.status]
  }

  join: view_08832 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08830.user_id} = ${view_08832.id} ;;
    required_joins: []
  }

  join: view_08833 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08830.account_id} = ${view_08833.account_id} ;;
    required_joins: [view_08832]
  }

  join: view_08834 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08830.category} = ${view_08834.category} ;;
  }

  access_filter: {
    field: view_08830.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08830.is_deleted} = false ;;
}
