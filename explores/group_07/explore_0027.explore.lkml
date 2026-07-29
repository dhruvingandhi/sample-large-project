# Explore: explore_0027
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00082.view.lkml"
include: "/views/domain_34/view_00084.view.lkml"
include: "/views/domain_35/view_00085.view.lkml"
include: "/views/domain_36/view_00086.view.lkml"

explore: explore_0027 {
  label: "Explore Explore 0027"
  description: "Comprehensive analytics explore joining base view_00082 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00082
  
  always_filter: {
    filters: [view_00082.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00082.created_at_date: "7 days"]
    unless: [view_00082.id, view_00082.status]
  }

  join: view_00084 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00082.user_id} = ${view_00084.id} ;;
    required_joins: []
  }

  join: view_00085 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00082.account_id} = ${view_00085.account_id} ;;
    required_joins: [view_00084]
  }

  join: view_00086 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00082.category} = ${view_00086.category} ;;
  }

  access_filter: {
    field: view_00082.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00082.is_deleted} = false ;;
}
