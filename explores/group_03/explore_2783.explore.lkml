# Explore: explore_2783
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08350.view.lkml"
include: "/views/domain_02/view_08352.view.lkml"
include: "/views/domain_03/view_08353.view.lkml"
include: "/views/domain_04/view_08354.view.lkml"

explore: explore_2783 {
  label: "Explore Explore 2783"
  description: "Comprehensive analytics explore joining base view_08350 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08350
  
  always_filter: {
    filters: [view_08350.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08350.created_at_date: "7 days"]
    unless: [view_08350.id, view_08350.status]
  }

  join: view_08352 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08350.user_id} = ${view_08352.id} ;;
    required_joins: []
  }

  join: view_08353 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08350.account_id} = ${view_08353.account_id} ;;
    required_joins: [view_08352]
  }

  join: view_08354 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08350.category} = ${view_08354.category} ;;
  }

  access_filter: {
    field: view_08350.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08350.is_deleted} = false ;;
}
