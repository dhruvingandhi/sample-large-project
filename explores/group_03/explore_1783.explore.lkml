# Explore: explore_1783
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05350.view.lkml"
include: "/views/domain_02/view_05352.view.lkml"
include: "/views/domain_03/view_05353.view.lkml"
include: "/views/domain_04/view_05354.view.lkml"

explore: explore_1783 {
  label: "Explore Explore 1783"
  description: "Comprehensive analytics explore joining base view_05350 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05350
  
  always_filter: {
    filters: [view_05350.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05350.created_at_date: "7 days"]
    unless: [view_05350.id, view_05350.status]
  }

  join: view_05352 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05350.user_id} = ${view_05352.id} ;;
    required_joins: []
  }

  join: view_05353 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05350.account_id} = ${view_05353.account_id} ;;
    required_joins: [view_05352]
  }

  join: view_05354 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05350.category} = ${view_05354.category} ;;
  }

  access_filter: {
    field: view_05350.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05350.is_deleted} = false ;;
}
