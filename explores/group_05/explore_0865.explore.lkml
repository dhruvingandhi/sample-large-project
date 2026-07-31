# Antigravity modified: branch dg-3
# Explore: explore_0865
# Auto-generated LookML Explore File

include: "/views/domain_46/view_02596.view.lkml"
include: "/views/domain_48/view_02598.view.lkml"
include: "/views/domain_49/view_02599.view.lkml"
include: "/views/domain_50/view_02600.view.lkml"

explore: explore_0865 {
  label: "Explore Explore 0865"
  description: "Comprehensive analytics explore joining base view_02596 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02596
  
  always_filter: {
    filters: [view_02596.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02596.created_at_date: "7 days"]
    unless: [view_02596.id, view_02596.status]
  }

  join: view_02598 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02596.user_id} = ${view_02598.id} ;;
    required_joins: []
  }

  join: view_02599 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02596.account_id} = ${view_02599.account_id} ;;
    required_joins: [view_02598]
  }

  join: view_02600 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02596.category} = ${view_02600.category} ;;
  }

  access_filter: {
    field: view_02596.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02596.is_deleted} = false ;;
}
