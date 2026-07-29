# Explore: explore_0389
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01168.view.lkml"
include: "/views/domain_20/view_01170.view.lkml"
include: "/views/domain_21/view_01171.view.lkml"
include: "/views/domain_22/view_01172.view.lkml"

explore: explore_0389 {
  label: "Explore Explore 0389"
  description: "Comprehensive analytics explore joining base view_01168 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01168
  
  always_filter: {
    filters: [view_01168.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01168.created_at_date: "7 days"]
    unless: [view_01168.id, view_01168.status]
  }

  join: view_01170 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01168.user_id} = ${view_01170.id} ;;
    required_joins: []
  }

  join: view_01171 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01168.account_id} = ${view_01171.account_id} ;;
    required_joins: [view_01170]
  }

  join: view_01172 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01168.category} = ${view_01172.category} ;;
  }

  access_filter: {
    field: view_01168.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01168.is_deleted} = false ;;
}
