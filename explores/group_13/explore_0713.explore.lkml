# Explore: explore_0713
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02140.view.lkml"
include: "/views/domain_42/view_02142.view.lkml"
include: "/views/domain_43/view_02143.view.lkml"
include: "/views/domain_44/view_02144.view.lkml"

explore: explore_0713 {
  label: "Explore Explore 0713"
  description: "Comprehensive analytics explore joining base view_02140 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02140
  
  always_filter: {
    filters: [view_02140.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02140.created_at_date: "7 days"]
    unless: [view_02140.id, view_02140.status]
  }

  join: view_02142 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02140.user_id} = ${view_02142.id} ;;
    required_joins: []
  }

  join: view_02143 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02140.account_id} = ${view_02143.account_id} ;;
    required_joins: [view_02142]
  }

  join: view_02144 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02140.category} = ${view_02144.category} ;;
  }

  access_filter: {
    field: view_02140.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02140.is_deleted} = false ;;
}
