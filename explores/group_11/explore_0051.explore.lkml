# Explore: explore_0051
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00154.view.lkml"
include: "/views/domain_06/view_00156.view.lkml"
include: "/views/domain_07/view_00157.view.lkml"
include: "/views/domain_08/view_00158.view.lkml"

explore: explore_0051 {
  label: "Explore Explore 0051"
  description: "Comprehensive analytics explore joining base view_00154 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00154
  
  always_filter: {
    filters: [view_00154.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00154.created_at_date: "7 days"]
    unless: [view_00154.id, view_00154.status]
  }

  join: view_00156 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00154.user_id} = ${view_00156.id} ;;
    required_joins: []
  }

  join: view_00157 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00154.account_id} = ${view_00157.account_id} ;;
    required_joins: [view_00156]
  }

  join: view_00158 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00154.category} = ${view_00158.category} ;;
  }

  access_filter: {
    field: view_00154.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00154.is_deleted} = false ;;
}
