# Update for 500 file diff target
# Explore: explore_1562
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04687.view.lkml"
include: "/views/domain_39/view_04689.view.lkml"
include: "/views/domain_40/view_04690.view.lkml"
include: "/views/domain_41/view_04691.view.lkml"

explore: explore_1562 {
  label: "Explore Explore 1562"
  description: "Comprehensive analytics explore joining base view_04687 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04687
  
  always_filter: {
    filters: [view_04687.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04687.created_at_date: "7 days"]
    unless: [view_04687.id, view_04687.status]
  }

  join: view_04689 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04687.user_id} = ${view_04689.id} ;;
    required_joins: []
  }

  join: view_04690 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04687.account_id} = ${view_04690.account_id} ;;
    required_joins: [view_04689]
  }

  join: view_04691 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04687.category} = ${view_04691.category} ;;
  }

  access_filter: {
    field: view_04687.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04687.is_deleted} = false ;;
}
