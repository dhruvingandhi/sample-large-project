# Explore: explore_2862
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08587.view.lkml"
include: "/views/domain_39/view_08589.view.lkml"
include: "/views/domain_40/view_08590.view.lkml"
include: "/views/domain_41/view_08591.view.lkml"

explore: explore_2862 {
  label: "Explore Explore 2862"
  description: "Comprehensive analytics explore joining base view_08587 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08587
  
  always_filter: {
    filters: [view_08587.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08587.created_at_date: "7 days"]
    unless: [view_08587.id, view_08587.status]
  }

  join: view_08589 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08587.user_id} = ${view_08589.id} ;;
    required_joins: []
  }

  join: view_08590 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08587.account_id} = ${view_08590.account_id} ;;
    required_joins: [view_08589]
  }

  join: view_08591 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08587.category} = ${view_08591.category} ;;
  }

  access_filter: {
    field: view_08587.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08587.is_deleted} = false ;;
}
