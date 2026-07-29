# Explore: explore_0141
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00424.view.lkml"
include: "/views/domain_26/view_00426.view.lkml"
include: "/views/domain_27/view_00427.view.lkml"
include: "/views/domain_28/view_00428.view.lkml"

explore: explore_0141 {
  label: "Explore Explore 0141"
  description: "Comprehensive analytics explore joining base view_00424 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00424
  
  always_filter: {
    filters: [view_00424.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00424.created_at_date: "7 days"]
    unless: [view_00424.id, view_00424.status]
  }

  join: view_00426 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00424.user_id} = ${view_00426.id} ;;
    required_joins: []
  }

  join: view_00427 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00424.account_id} = ${view_00427.account_id} ;;
    required_joins: [view_00426]
  }

  join: view_00428 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00424.category} = ${view_00428.category} ;;
  }

  access_filter: {
    field: view_00424.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00424.is_deleted} = false ;;
}
