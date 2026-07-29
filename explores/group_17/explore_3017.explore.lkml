# Explore: explore_3017
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09052.view.lkml"
include: "/views/domain_04/view_09054.view.lkml"
include: "/views/domain_05/view_09055.view.lkml"
include: "/views/domain_06/view_09056.view.lkml"

explore: explore_3017 {
  label: "Explore Explore 3017"
  description: "Comprehensive analytics explore joining base view_09052 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09052
  
  always_filter: {
    filters: [view_09052.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09052.created_at_date: "7 days"]
    unless: [view_09052.id, view_09052.status]
  }

  join: view_09054 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09052.user_id} = ${view_09054.id} ;;
    required_joins: []
  }

  join: view_09055 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09052.account_id} = ${view_09055.account_id} ;;
    required_joins: [view_09054]
  }

  join: view_09056 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09052.category} = ${view_09056.category} ;;
  }

  access_filter: {
    field: view_09052.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09052.is_deleted} = false ;;
}
