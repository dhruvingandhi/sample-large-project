# Explore: explore_1353
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04060.view.lkml"
include: "/views/domain_12/view_04062.view.lkml"
include: "/views/domain_13/view_04063.view.lkml"
include: "/views/domain_14/view_04064.view.lkml"

explore: explore_1353 {
  label: "Explore Explore 1353"
  description: "Comprehensive analytics explore joining base view_04060 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04060
  
  always_filter: {
    filters: [view_04060.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04060.created_at_date: "7 days"]
    unless: [view_04060.id, view_04060.status]
  }

  join: view_04062 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04060.user_id} = ${view_04062.id} ;;
    required_joins: []
  }

  join: view_04063 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04060.account_id} = ${view_04063.account_id} ;;
    required_joins: [view_04062]
  }

  join: view_04064 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04060.category} = ${view_04064.category} ;;
  }

  access_filter: {
    field: view_04060.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04060.is_deleted} = false ;;
}
