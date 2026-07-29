# Explore: explore_0783
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02350.view.lkml"
include: "/views/domain_02/view_02352.view.lkml"
include: "/views/domain_03/view_02353.view.lkml"
include: "/views/domain_04/view_02354.view.lkml"

explore: explore_0783 {
  label: "Explore Explore 0783"
  description: "Comprehensive analytics explore joining base view_02350 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02350
  
  always_filter: {
    filters: [view_02350.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02350.created_at_date: "7 days"]
    unless: [view_02350.id, view_02350.status]
  }

  join: view_02352 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02350.user_id} = ${view_02352.id} ;;
    required_joins: []
  }

  join: view_02353 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02350.account_id} = ${view_02353.account_id} ;;
    required_joins: [view_02352]
  }

  join: view_02354 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02350.category} = ${view_02354.category} ;;
  }

  access_filter: {
    field: view_02350.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02350.is_deleted} = false ;;
}
