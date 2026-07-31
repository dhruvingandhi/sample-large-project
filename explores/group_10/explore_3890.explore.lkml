# Update for 2000 file diff target
# Explore: explore_3890
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11671.view.lkml"
include: "/views/domain_23/view_11673.view.lkml"
include: "/views/domain_24/view_11674.view.lkml"
include: "/views/domain_25/view_11675.view.lkml"

explore: explore_3890 {
  label: "Explore Explore 3890"
  description: "Comprehensive analytics explore joining base view_11671 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11671
  
  always_filter: {
    filters: [view_11671.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11671.created_at_date: "7 days"]
    unless: [view_11671.id, view_11671.status]
  }

  join: view_11673 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11671.user_id} = ${view_11673.id} ;;
    required_joins: []
  }

  join: view_11674 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11671.account_id} = ${view_11674.account_id} ;;
    required_joins: [view_11673]
  }

  join: view_11675 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11671.category} = ${view_11675.category} ;;
  }

  access_filter: {
    field: view_11671.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11671.is_deleted} = false ;;
}
