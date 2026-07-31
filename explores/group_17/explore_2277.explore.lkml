# Update for 2000 file diff target
# Explore: explore_2277
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06832.view.lkml"
include: "/views/domain_34/view_06834.view.lkml"
include: "/views/domain_35/view_06835.view.lkml"
include: "/views/domain_36/view_06836.view.lkml"

explore: explore_2277 {
  label: "Explore Explore 2277"
  description: "Comprehensive analytics explore joining base view_06832 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06832
  
  always_filter: {
    filters: [view_06832.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06832.created_at_date: "7 days"]
    unless: [view_06832.id, view_06832.status]
  }

  join: view_06834 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06832.user_id} = ${view_06834.id} ;;
    required_joins: []
  }

  join: view_06835 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06832.account_id} = ${view_06835.account_id} ;;
    required_joins: [view_06834]
  }

  join: view_06836 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06832.category} = ${view_06836.category} ;;
  }

  access_filter: {
    field: view_06832.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06832.is_deleted} = false ;;
}
