# Explore: explore_3072
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09217.view.lkml"
include: "/views/domain_19/view_09219.view.lkml"
include: "/views/domain_20/view_09220.view.lkml"
include: "/views/domain_21/view_09221.view.lkml"

explore: explore_3072 {
  label: "Explore Explore 3072"
  description: "Comprehensive analytics explore joining base view_09217 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09217
  
  always_filter: {
    filters: [view_09217.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09217.created_at_date: "7 days"]
    unless: [view_09217.id, view_09217.status]
  }

  join: view_09219 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09217.user_id} = ${view_09219.id} ;;
    required_joins: []
  }

  join: view_09220 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09217.account_id} = ${view_09220.account_id} ;;
    required_joins: [view_09219]
  }

  join: view_09221 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09217.category} = ${view_09221.category} ;;
  }

  access_filter: {
    field: view_09217.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09217.is_deleted} = false ;;
}
