# Update for 500 file diff target
# Explore: explore_0862
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02587.view.lkml"
include: "/views/domain_39/view_02589.view.lkml"
include: "/views/domain_40/view_02590.view.lkml"
include: "/views/domain_41/view_02591.view.lkml"

explore: explore_0862 {
  label: "Explore Explore 0862"
  description: "Comprehensive analytics explore joining base view_02587 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02587
  
  always_filter: {
    filters: [view_02587.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02587.created_at_date: "7 days"]
    unless: [view_02587.id, view_02587.status]
  }

  join: view_02589 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02587.user_id} = ${view_02589.id} ;;
    required_joins: []
  }

  join: view_02590 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02587.account_id} = ${view_02590.account_id} ;;
    required_joins: [view_02589]
  }

  join: view_02591 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02587.category} = ${view_02591.category} ;;
  }

  access_filter: {
    field: view_02587.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02587.is_deleted} = false ;;
}
