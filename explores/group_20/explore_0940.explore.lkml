# Update for 2000 file diff target
# Explore: explore_0940
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02821.view.lkml"
include: "/views/domain_23/view_02823.view.lkml"
include: "/views/domain_24/view_02824.view.lkml"
include: "/views/domain_25/view_02825.view.lkml"

explore: explore_0940 {
  label: "Explore Explore 0940"
  description: "Comprehensive analytics explore joining base view_02821 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02821
  
  always_filter: {
    filters: [view_02821.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02821.created_at_date: "7 days"]
    unless: [view_02821.id, view_02821.status]
  }

  join: view_02823 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02821.user_id} = ${view_02823.id} ;;
    required_joins: []
  }

  join: view_02824 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02821.account_id} = ${view_02824.account_id} ;;
    required_joins: [view_02823]
  }

  join: view_02825 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02821.category} = ${view_02825.category} ;;
  }

  access_filter: {
    field: view_02821.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02821.is_deleted} = false ;;
}
