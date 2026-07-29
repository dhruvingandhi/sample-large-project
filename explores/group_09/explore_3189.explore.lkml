# Explore: explore_3189
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09568.view.lkml"
include: "/views/domain_20/view_09570.view.lkml"
include: "/views/domain_21/view_09571.view.lkml"
include: "/views/domain_22/view_09572.view.lkml"

explore: explore_3189 {
  label: "Explore Explore 3189"
  description: "Comprehensive analytics explore joining base view_09568 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09568
  
  always_filter: {
    filters: [view_09568.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09568.created_at_date: "7 days"]
    unless: [view_09568.id, view_09568.status]
  }

  join: view_09570 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09568.user_id} = ${view_09570.id} ;;
    required_joins: []
  }

  join: view_09571 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09568.account_id} = ${view_09571.account_id} ;;
    required_joins: [view_09570]
  }

  join: view_09572 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09568.category} = ${view_09572.category} ;;
  }

  access_filter: {
    field: view_09568.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09568.is_deleted} = false ;;
}
