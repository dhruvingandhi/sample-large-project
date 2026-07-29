# Explore: explore_3783
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11350.view.lkml"
include: "/views/domain_02/view_11352.view.lkml"
include: "/views/domain_03/view_11353.view.lkml"
include: "/views/domain_04/view_11354.view.lkml"

explore: explore_3783 {
  label: "Explore Explore 3783"
  description: "Comprehensive analytics explore joining base view_11350 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11350
  
  always_filter: {
    filters: [view_11350.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11350.created_at_date: "7 days"]
    unless: [view_11350.id, view_11350.status]
  }

  join: view_11352 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11350.user_id} = ${view_11352.id} ;;
    required_joins: []
  }

  join: view_11353 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11350.account_id} = ${view_11353.account_id} ;;
    required_joins: [view_11352]
  }

  join: view_11354 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11350.category} = ${view_11354.category} ;;
  }

  access_filter: {
    field: view_11350.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11350.is_deleted} = false ;;
}
