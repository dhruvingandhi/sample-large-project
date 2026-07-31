# Update for 2000 file diff target
# Explore: explore_3620
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10861.view.lkml"
include: "/views/domain_13/view_10863.view.lkml"
include: "/views/domain_14/view_10864.view.lkml"
include: "/views/domain_15/view_10865.view.lkml"

explore: explore_3620 {
  label: "Explore Explore 3620"
  description: "Comprehensive analytics explore joining base view_10861 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10861
  
  always_filter: {
    filters: [view_10861.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10861.created_at_date: "7 days"]
    unless: [view_10861.id, view_10861.status]
  }

  join: view_10863 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10861.user_id} = ${view_10863.id} ;;
    required_joins: []
  }

  join: view_10864 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10861.account_id} = ${view_10864.account_id} ;;
    required_joins: [view_10863]
  }

  join: view_10865 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10861.category} = ${view_10865.category} ;;
  }

  access_filter: {
    field: view_10861.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10861.is_deleted} = false ;;
}
