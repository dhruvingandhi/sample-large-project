# Explore: explore_3642
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10927.view.lkml"
include: "/views/domain_29/view_10929.view.lkml"
include: "/views/domain_30/view_10930.view.lkml"
include: "/views/domain_31/view_10931.view.lkml"

explore: explore_3642 {
  label: "Explore Explore 3642"
  description: "Comprehensive analytics explore joining base view_10927 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10927
  
  always_filter: {
    filters: [view_10927.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10927.created_at_date: "7 days"]
    unless: [view_10927.id, view_10927.status]
  }

  join: view_10929 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10927.user_id} = ${view_10929.id} ;;
    required_joins: []
  }

  join: view_10930 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10927.account_id} = ${view_10930.account_id} ;;
    required_joins: [view_10929]
  }

  join: view_10931 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10927.category} = ${view_10931.category} ;;
  }

  access_filter: {
    field: view_10927.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10927.is_deleted} = false ;;
}
