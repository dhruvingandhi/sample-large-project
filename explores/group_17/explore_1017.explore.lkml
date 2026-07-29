# Explore: explore_1017
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03052.view.lkml"
include: "/views/domain_04/view_03054.view.lkml"
include: "/views/domain_05/view_03055.view.lkml"
include: "/views/domain_06/view_03056.view.lkml"

explore: explore_1017 {
  label: "Explore Explore 1017"
  description: "Comprehensive analytics explore joining base view_03052 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03052
  
  always_filter: {
    filters: [view_03052.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03052.created_at_date: "7 days"]
    unless: [view_03052.id, view_03052.status]
  }

  join: view_03054 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03052.user_id} = ${view_03054.id} ;;
    required_joins: []
  }

  join: view_03055 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03052.account_id} = ${view_03055.account_id} ;;
    required_joins: [view_03054]
  }

  join: view_03056 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03052.category} = ${view_03056.category} ;;
  }

  access_filter: {
    field: view_03052.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03052.is_deleted} = false ;;
}
