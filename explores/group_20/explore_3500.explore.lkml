# Explore: explore_3500
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10501.view.lkml"
include: "/views/domain_03/view_10503.view.lkml"
include: "/views/domain_04/view_10504.view.lkml"
include: "/views/domain_05/view_10505.view.lkml"

explore: explore_3500 {
  label: "Explore Explore 3500"
  description: "Comprehensive analytics explore joining base view_10501 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10501
  
  always_filter: {
    filters: [view_10501.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10501.created_at_date: "7 days"]
    unless: [view_10501.id, view_10501.status]
  }

  join: view_10503 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10501.user_id} = ${view_10503.id} ;;
    required_joins: []
  }

  join: view_10504 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10501.account_id} = ${view_10504.account_id} ;;
    required_joins: [view_10503]
  }

  join: view_10505 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10501.category} = ${view_10505.category} ;;
  }

  access_filter: {
    field: view_10501.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10501.is_deleted} = false ;;
}
