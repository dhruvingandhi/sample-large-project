# Explore: explore_3713
# Auto-generated LookML Explore File

include: "/views/domain_40/view_11140.view.lkml"
include: "/views/domain_42/view_11142.view.lkml"
include: "/views/domain_43/view_11143.view.lkml"
include: "/views/domain_44/view_11144.view.lkml"

explore: explore_3713 {
  label: "Explore Explore 3713"
  description: "Comprehensive analytics explore joining base view_11140 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11140
  
  always_filter: {
    filters: [view_11140.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11140.created_at_date: "7 days"]
    unless: [view_11140.id, view_11140.status]
  }

  join: view_11142 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11140.user_id} = ${view_11142.id} ;;
    required_joins: []
  }

  join: view_11143 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11140.account_id} = ${view_11143.account_id} ;;
    required_joins: [view_11142]
  }

  join: view_11144 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11140.category} = ${view_11144.category} ;;
  }

  access_filter: {
    field: view_11140.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11140.is_deleted} = false ;;
}
