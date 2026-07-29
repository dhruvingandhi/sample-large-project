# Explore: explore_0209
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00628.view.lkml"
include: "/views/domain_30/view_00630.view.lkml"
include: "/views/domain_31/view_00631.view.lkml"
include: "/views/domain_32/view_00632.view.lkml"

explore: explore_0209 {
  label: "Explore Explore 0209"
  description: "Comprehensive analytics explore joining base view_00628 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00628
  
  always_filter: {
    filters: [view_00628.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00628.created_at_date: "7 days"]
    unless: [view_00628.id, view_00628.status]
  }

  join: view_00630 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00628.user_id} = ${view_00630.id} ;;
    required_joins: []
  }

  join: view_00631 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00628.account_id} = ${view_00631.account_id} ;;
    required_joins: [view_00630]
  }

  join: view_00632 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00628.category} = ${view_00632.category} ;;
  }

  access_filter: {
    field: view_00628.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00628.is_deleted} = false ;;
}
