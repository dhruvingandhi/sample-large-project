# Update for 2000 file diff target
# Explore: explore_3579
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10738.view.lkml"
include: "/views/domain_40/view_10740.view.lkml"
include: "/views/domain_41/view_10741.view.lkml"
include: "/views/domain_42/view_10742.view.lkml"

explore: explore_3579 {
  label: "Explore Explore 3579"
  description: "Comprehensive analytics explore joining base view_10738 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10738
  
  always_filter: {
    filters: [view_10738.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10738.created_at_date: "7 days"]
    unless: [view_10738.id, view_10738.status]
  }

  join: view_10740 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10738.user_id} = ${view_10740.id} ;;
    required_joins: []
  }

  join: view_10741 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10738.account_id} = ${view_10741.account_id} ;;
    required_joins: [view_10740]
  }

  join: view_10742 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10738.category} = ${view_10742.category} ;;
  }

  access_filter: {
    field: view_10738.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10738.is_deleted} = false ;;
}
