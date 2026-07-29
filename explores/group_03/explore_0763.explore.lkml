# Explore: explore_0763
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02290.view.lkml"
include: "/views/domain_42/view_02292.view.lkml"
include: "/views/domain_43/view_02293.view.lkml"
include: "/views/domain_44/view_02294.view.lkml"

explore: explore_0763 {
  label: "Explore Explore 0763"
  description: "Comprehensive analytics explore joining base view_02290 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02290
  
  always_filter: {
    filters: [view_02290.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02290.created_at_date: "7 days"]
    unless: [view_02290.id, view_02290.status]
  }

  join: view_02292 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02290.user_id} = ${view_02292.id} ;;
    required_joins: []
  }

  join: view_02293 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02290.account_id} = ${view_02293.account_id} ;;
    required_joins: [view_02292]
  }

  join: view_02294 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02290.category} = ${view_02294.category} ;;
  }

  access_filter: {
    field: view_02290.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02290.is_deleted} = false ;;
}
