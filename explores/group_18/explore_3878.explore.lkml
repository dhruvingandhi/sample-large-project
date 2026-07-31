# Update for 2000 file diff target
# Explore: explore_3878
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11635.view.lkml"
include: "/views/domain_37/view_11637.view.lkml"
include: "/views/domain_38/view_11638.view.lkml"
include: "/views/domain_39/view_11639.view.lkml"

explore: explore_3878 {
  label: "Explore Explore 3878"
  description: "Comprehensive analytics explore joining base view_11635 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11635
  
  always_filter: {
    filters: [view_11635.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11635.created_at_date: "7 days"]
    unless: [view_11635.id, view_11635.status]
  }

  join: view_11637 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11635.user_id} = ${view_11637.id} ;;
    required_joins: []
  }

  join: view_11638 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11635.account_id} = ${view_11638.account_id} ;;
    required_joins: [view_11637]
  }

  join: view_11639 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11635.category} = ${view_11639.category} ;;
  }

  access_filter: {
    field: view_11635.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11635.is_deleted} = false ;;
}
