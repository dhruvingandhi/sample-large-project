# Explore: explore_0246
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00739.view.lkml"
include: "/views/domain_41/view_00741.view.lkml"
include: "/views/domain_42/view_00742.view.lkml"
include: "/views/domain_43/view_00743.view.lkml"

explore: explore_0246 {
  label: "Explore Explore 0246"
  description: "Comprehensive analytics explore joining base view_00739 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00739
  
  always_filter: {
    filters: [view_00739.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00739.created_at_date: "7 days"]
    unless: [view_00739.id, view_00739.status]
  }

  join: view_00741 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00739.user_id} = ${view_00741.id} ;;
    required_joins: []
  }

  join: view_00742 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00739.account_id} = ${view_00742.account_id} ;;
    required_joins: [view_00741]
  }

  join: view_00743 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00739.category} = ${view_00743.category} ;;
  }

  access_filter: {
    field: view_00739.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00739.is_deleted} = false ;;
}
