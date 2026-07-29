# Explore: explore_3611
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10834.view.lkml"
include: "/views/domain_36/view_10836.view.lkml"
include: "/views/domain_37/view_10837.view.lkml"
include: "/views/domain_38/view_10838.view.lkml"

explore: explore_3611 {
  label: "Explore Explore 3611"
  description: "Comprehensive analytics explore joining base view_10834 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10834
  
  always_filter: {
    filters: [view_10834.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10834.created_at_date: "7 days"]
    unless: [view_10834.id, view_10834.status]
  }

  join: view_10836 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10834.user_id} = ${view_10836.id} ;;
    required_joins: []
  }

  join: view_10837 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10834.account_id} = ${view_10837.account_id} ;;
    required_joins: [view_10836]
  }

  join: view_10838 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10834.category} = ${view_10838.category} ;;
  }

  access_filter: {
    field: view_10834.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10834.is_deleted} = false ;;
}
