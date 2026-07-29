# Explore: explore_2280
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06841.view.lkml"
include: "/views/domain_43/view_06843.view.lkml"
include: "/views/domain_44/view_06844.view.lkml"
include: "/views/domain_45/view_06845.view.lkml"

explore: explore_2280 {
  label: "Explore Explore 2280"
  description: "Comprehensive analytics explore joining base view_06841 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06841
  
  always_filter: {
    filters: [view_06841.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06841.created_at_date: "7 days"]
    unless: [view_06841.id, view_06841.status]
  }

  join: view_06843 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06841.user_id} = ${view_06843.id} ;;
    required_joins: []
  }

  join: view_06844 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06841.account_id} = ${view_06844.account_id} ;;
    required_joins: [view_06843]
  }

  join: view_06845 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06841.category} = ${view_06845.category} ;;
  }

  access_filter: {
    field: view_06841.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06841.is_deleted} = false ;;
}
