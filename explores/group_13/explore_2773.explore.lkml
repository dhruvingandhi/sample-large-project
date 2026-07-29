# Explore: explore_2773
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08320.view.lkml"
include: "/views/domain_22/view_08322.view.lkml"
include: "/views/domain_23/view_08323.view.lkml"
include: "/views/domain_24/view_08324.view.lkml"

explore: explore_2773 {
  label: "Explore Explore 2773"
  description: "Comprehensive analytics explore joining base view_08320 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08320
  
  always_filter: {
    filters: [view_08320.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08320.created_at_date: "7 days"]
    unless: [view_08320.id, view_08320.status]
  }

  join: view_08322 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08320.user_id} = ${view_08322.id} ;;
    required_joins: []
  }

  join: view_08323 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08320.account_id} = ${view_08323.account_id} ;;
    required_joins: [view_08322]
  }

  join: view_08324 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08320.category} = ${view_08324.category} ;;
  }

  access_filter: {
    field: view_08320.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08320.is_deleted} = false ;;
}
