# Explore: explore_0871
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02614.view.lkml"
include: "/views/domain_16/view_02616.view.lkml"
include: "/views/domain_17/view_02617.view.lkml"
include: "/views/domain_18/view_02618.view.lkml"

explore: explore_0871 {
  label: "Explore Explore 0871"
  description: "Comprehensive analytics explore joining base view_02614 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02614
  
  always_filter: {
    filters: [view_02614.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02614.created_at_date: "7 days"]
    unless: [view_02614.id, view_02614.status]
  }

  join: view_02616 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02614.user_id} = ${view_02616.id} ;;
    required_joins: []
  }

  join: view_02617 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02614.account_id} = ${view_02617.account_id} ;;
    required_joins: [view_02616]
  }

  join: view_02618 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02614.category} = ${view_02618.category} ;;
  }

  access_filter: {
    field: view_02614.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02614.is_deleted} = false ;;
}
