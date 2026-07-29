# Explore: explore_1239
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03718.view.lkml"
include: "/views/domain_20/view_03720.view.lkml"
include: "/views/domain_21/view_03721.view.lkml"
include: "/views/domain_22/view_03722.view.lkml"

explore: explore_1239 {
  label: "Explore Explore 1239"
  description: "Comprehensive analytics explore joining base view_03718 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03718
  
  always_filter: {
    filters: [view_03718.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03718.created_at_date: "7 days"]
    unless: [view_03718.id, view_03718.status]
  }

  join: view_03720 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03718.user_id} = ${view_03720.id} ;;
    required_joins: []
  }

  join: view_03721 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03718.account_id} = ${view_03721.account_id} ;;
    required_joins: [view_03720]
  }

  join: view_03722 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03718.category} = ${view_03722.category} ;;
  }

  access_filter: {
    field: view_03718.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03718.is_deleted} = false ;;
}
