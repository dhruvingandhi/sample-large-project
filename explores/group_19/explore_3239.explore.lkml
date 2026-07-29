# Explore: explore_3239
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09718.view.lkml"
include: "/views/domain_20/view_09720.view.lkml"
include: "/views/domain_21/view_09721.view.lkml"
include: "/views/domain_22/view_09722.view.lkml"

explore: explore_3239 {
  label: "Explore Explore 3239"
  description: "Comprehensive analytics explore joining base view_09718 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09718
  
  always_filter: {
    filters: [view_09718.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09718.created_at_date: "7 days"]
    unless: [view_09718.id, view_09718.status]
  }

  join: view_09720 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09718.user_id} = ${view_09720.id} ;;
    required_joins: []
  }

  join: view_09721 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09718.account_id} = ${view_09721.account_id} ;;
    required_joins: [view_09720]
  }

  join: view_09722 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09718.category} = ${view_09722.category} ;;
  }

  access_filter: {
    field: view_09718.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09718.is_deleted} = false ;;
}
