# Explore: explore_0384
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01153.view.lkml"
include: "/views/domain_05/view_01155.view.lkml"
include: "/views/domain_06/view_01156.view.lkml"
include: "/views/domain_07/view_01157.view.lkml"

explore: explore_0384 {
  label: "Explore Explore 0384"
  description: "Comprehensive analytics explore joining base view_01153 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01153
  
  always_filter: {
    filters: [view_01153.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01153.created_at_date: "7 days"]
    unless: [view_01153.id, view_01153.status]
  }

  join: view_01155 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01153.user_id} = ${view_01155.id} ;;
    required_joins: []
  }

  join: view_01156 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01153.account_id} = ${view_01156.account_id} ;;
    required_joins: [view_01155]
  }

  join: view_01157 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01153.category} = ${view_01157.category} ;;
  }

  access_filter: {
    field: view_01153.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01153.is_deleted} = false ;;
}
